/*
 * File:	generator.cpp
 *
 * Description:	This file contains the public and member function
 *		definitions for the code generator for Simple C.
 *
 *		Extra functionality:
 *		- putting all the global declarations at the end
 */

# include <sstream>
# include <iostream>
# include "generator.h"
# include "machine.h"

using namespace std;

static unsigned maxargs;
int temp_offset;
vector<string> string_vector;

/* Labels   */
struct Label{
	static unsigned counter;
	unsigned number;
	Label() {number = counter++;}
};
unsigned Label::counter = 0;
ostream &operator<<(ostream &ostr, const Label &lbl){
	return ostr << ".L" << lbl.number;
}

vector<Label*> break_into;

void String::generate(){
	//create a new label, becuase in file you'll say l2.asciz "hello"
	Label *string = new Label();
	//have some global vector <string> Hello (lowercase string)
	stringstream ss;
	ss << *string;
	_operand = ss.str();
	ss << ":" <<" .asciz, " << _value;
	string_vector.push_back(ss.str());
}
Label *retLbl;

/* 
// slides from 
stream *operator<<(ostream *os, Expression *expr){
	os <<expr->_operand;
	return os;
}
*/

void assignTemp(Expression *expr){
	// decrement temp_offset
	stringstream ss;
	temp_offset -= expr->type().size();
	// assign offset to _operand
	ss << temp_offset << "(%EBP)";
	expr->_operand = ss.str();
	// example: -24(EBP)
}



/*
 * Function:	operator <<
 *
 * Description:	Convenience function for writing the operand of an
 *		expression.
 */

ostream &operator <<(ostream &ostr, Expression *expr)
{
    return ostr << expr->_operand;
}

void Expression::generate(){
	cerr << "oops" << endl;
}

void Expression::generate(bool &ind){
	ind = false;
	generate();
}


/*
 * Function:	Identifier::generate
 *
 * Description:	Generate code for an identifier.  Since there is really no
 *		code to generate, we simply update our operand.
 */

void Identifier::generate()
{
    stringstream ss;


    if (_symbol->_offset != 0)
	ss << _symbol->_offset << "(%ebp)";
    else
	ss << global_prefix << _symbol->name();

    _operand = ss.str();
}


/*
 * Function:	Number::generate
 *
 * Description:	Generate code for a number.  Since there is really no code
 *		to generate, we simply update our operand.
 */

void Number::generate()
{
    stringstream ss;


    ss << "$" << _value;
    _operand = ss.str();
}


# if STACK_ALIGNMENT == 4

/*
 * Function:	Call::generate
 *
 * Description:	Generate code for a function call expression, in which each
 *		argument is simply a variable or an integer literal.
 */


void Call::generate()
{
	cout <<"#calling" << endl;
    unsigned numBytes = 0;

    for (int i = _args.size() - 1; i >= 0; i --) {
	_args[i]->generate();
	cout << "\tpushl\t" << _args[i] << endl;
	numBytes += _args[i]->type().size();
    }

    cout << "\tcall\t" << global_prefix << _id->name() << endl;
	assignTemp(this);
	cout << "\tmovl \t%eax," << this << endl;

    if (numBytes > 0)
	cout << "\taddl\t$" << numBytes << ", %esp" << endl;
	cout <<"#end calling" << endl;
}

# else

/*
 * If the stack has to be aligned to a certain size before a function call
 * then we cannot push the arguments in the order we see them.  If we had
 * nested function calls, we cannot guarantee that the stack would be
 * aligned.
 *
 * Instead, we must know the maximum number of arguments so we can compute
 * the size of the frame.  Again, we cannot just move the arguments onto
 * the stack as we see them because of nested function calls.  Rather, we
 * have to generate code for all arguments first and then move the results
 * onto the stack.  This will likely cause a lot of spills.
 *
 * For now, since each argument is going to be either a number of in
 * memory, we just load it into %eax and then move %eax onto the stack.
 */

void Call::generate()
{
	cout << "#calling 2" << endl;
	if (_args.size() > maxargs)
		maxargs = _args.size();

	for (int i = _args.size() - 1; i >= 0; i --) {
		_args[i]->generate();
		cout << "\tmovl\t" << _args[i] << ", %eax" << endl;
		cout << "\tmovl\t%eax, " << i * SIZEOF_ARG << "(%esp)" << endl;
	}

	cout << "\tcall\t" << global_prefix << _id->name() << endl;
	// move eax into temp register
	assignTemp(this);
	cout << "\tmovl \t%eax," << this << endl;
	cout << "#end calling" << endl;
}

# endif


void Return::generate(){
	cout << "#returning" << endl;
	_expr->generate();
	//store return value
	//move _expr into eax
	cout << "\tmovl\t" << _expr << ", %eax" << endl;
	//go to label
	cout << "\tjmp\t" << *retLbl << endl;
	cout <<"#end return" << endl;
}


/*
 * Function:	Assignment::generate
 *
 * Description:	Generate code for this assignment statement, in which the
 *		right-hand side is an integer literal and the left-hand
 *		side is an integer scalar variable.  Actually, the way
 *		we've written things, the right-side can be a variable too.
 */

void Assignment::generate()
{
	cout << "#assigning" << endl;
	bool ind; // assingd by generate??
	cout << "#gen left" << endl;
	_left->generate(ind);
	cout << "#gen right" << endl;
	_right->generate();

	// from slide 9/12
	if(ind){
		cout <<"#ind" << endl;
		cout << "#right assign" << endl;
		cout << "\tmovl \t" << _right << ", %eax" << endl;
		cout << "#left assign" << endl;
		cout << "\tmovl \t" << _left << ", %ecx" << endl;
		if (_left->type().size() == 1)
			cout << "\tmovb \t%al, (%ecx)" << endl;
		else
			cout << "\tmovl \t%eax, (%ecx)" << endl;
	}
	else{
		cout <<"#not ind" << endl;
		cout << "#right assign" << endl;
		cout << "\tmovl \t" << _right << ", %eax" << endl;
		cout << "#left assign" << endl;
		if (_left->type().size() == 1)
			cout << "movb \t%al, " << _left << endl;
		else
			cout << "\tmovl \t%eax," << _left << endl;
	}

	cout << "#end assigning" << endl;
}


/*
 * Function:	Block::generate
 *
 * Description:	Generate code for this block, which simply means we
 *		generate code for each statement within the block.
 */

void Block::generate()
{
	for (unsigned i = 0; i < _stmts.size(); i++)
		_stmts[i]->generate();
}


/*
 * Function:	Function::generate
 *
 * Description:	Generate code for this function, which entails allocating
 *		space for local variables, then emitting our prologue, the
 *		body of the function, and the epilogue.
 */

void Function::generate()
{
	int offset = 0;


	/* Generate our prologue. */

	allocate(offset);
	cout << global_prefix << _id->name() << ":" << endl;
	cout << "\tpushl\t%ebp" << endl;
	cout << "\tmovl\t%esp, %ebp" << endl;
	cout << "\tsubl\t$" << _id->name() << ".size, %esp" << endl;


	/* Generate the body of this function. */

	maxargs = 0;

	retLbl = new Label();//set new label
	temp_offset = offset;
	_body->generate();
	offset = temp_offset;

	offset -= maxargs * SIZEOF_ARG;

	while ((offset - PARAM_OFFSET) % STACK_ALIGNMENT)
		offset --;


	/* Generate our epilogue. */

	//print label
	cout << *retLbl << ":"<< endl;

	cout << "\tmovl\t%ebp, %esp" << endl;
	cout << "\tpopl\t%ebp" << endl;
	cout << "\tret" << endl << endl;

	cout << "\t.globl\t" << global_prefix << _id->name() << endl;
	cout << "\t.set\t" << _id->name() << ".size, " << -offset << endl;

	cout << endl;
}


/*
 * Function:	generateGlobals
 *
 * Description:	Generate code for any global variable declarations.
 */
void generateGlobals(const Symbols &globals)
{
	if (globals.size() > 0)
		cout << "\t.data" << endl;

	for (unsigned i = 0; i < globals.size(); i ++) {
		cout << "\t.comm\t" << global_prefix << globals[i]->name();
		cout << ", " << globals[i]->type().size();
		cout << ", " << globals[i]->type().alignment() << endl;
	}

	if(string_vector.size()){
		for(unsigned i = 0; i < string_vector.size(); i++){
			cout <<"\t" << string_vector[i] << endl;
		}
	}
}

//need to reduce # of registers useing the optimal algorithm???

void Divide::generate(){
	cout <<"#dividing" << endl;
	_left->generate();
	_right->generate();

	cout <<"\tmovl \t" << _left << ", %eax" << endl;
	cout <<"\tmovl \t" << _right << ", %ecx" << endl;
	cout <<"\tcltd" << endl;
	cout << "\tidiv \t%ecx" << endl;
	assignTemp(this);	
	cout << "\tmovl \t%eax, " << this << endl;
	cout <<"#ending divide" << endl;
}

void Remainder::generate(){
	cout <<"#remainder" << endl;
	_left->generate();
	_left->generate();
	_right->generate();
	cout <<"\tmovl \t" << _left << ", %eax" << endl;
	cout <<"\tmovl \t" << _right << ", %ecx" << endl;
	cout <<"\tcltd" << endl;
	cout << "\tidivl \t%ecx" << endl;
	assignTemp(this);
	cout << "\tmovl \t%edx, " << this  << endl;
	cout <<"#ending remainder" << endl;
}

void Multiply::generate(){
	cout <<"#multiply" << endl;
	_left->generate();
	_right->generate();
	cout <<"\tmovl \t" << _left << ", %eax" << endl;
	cout <<"\timull \t"<< _right<<", %eax" << endl;
	assignTemp(this);	
	cout << "\tmovl \t%eax, " << this << endl;
	cout <<"#ending multiply" << endl;
	_left->generate();
}

void Add::generate(){
	cout << "#adding" << endl;
	_left->generate();
	_right->generate();

	cout <<"\tmovl \t" << _left << ", %eax" << endl;
	cout <<"\taddl \t" << _right << ", %eax" << endl;
	assignTemp(this);	
	cout << "\tmovl \t%eax, " << this << endl;
	cout << "#end adding" << endl;
}

void Subtract::generate(){
	cout <<"#subtracting" << endl;
	_left->generate();
	_right->generate();

	cout <<"\tmovl \t" << _left << ", %eax" << endl;
	cout <<"\tsubl \t" << _right << ", %eax" << endl;
	assignTemp(this);
	cout << "\tmovl \t%eax, " << this << endl;
	cout <<"#ending subtract" << endl;
}

// each has an Expression * _expr
void Not::generate(){
	cout << "#not" << endl;
	_expr->generate();

	cout << "\tmovl \t" << _expr << ", %eax" << endl;
	cout << "\tcmpl \t$0, %eax" << endl;
	cout << "\tsete \t%al" << endl;
	cout << "\tmovzbl \t%al, %eax" << endl;
	assignTemp(this);
	cout << "\tmovl \t%eax, " << this << endl;

	cout << "#ending not" << endl;
}

void Negate::generate(){
	cout << "#negating" << endl;
	assignTemp(this);
	_expr->generate();

	cout << "\tmovl \t" << _expr << ", %eax" << endl;
	cout << "\tnegl \t%eax" << endl;
	cout << "\tmovl \t%eax, " << this << endl;

	cout << "#ending negate" << endl;
}

void Address::generate(){
	cout << "#addressing" << endl;

	// from slide 8/12
	bool ind;
	_expr->generate(ind);

	if (ind)
		_operand = _expr ->_operand;
	else{
		assignTemp(this);
		cout << "\tleal \t" <<_expr<<", %eax" << endl;
		cout << "\tmovl \t%eax, " << this << endl;
	}

	cout <<"#ending addressing" << endl;
}

// from slide 8/12 and 9/12
void Dereference::generate(bool &ind){
	cout <<"#dereference ind" << endl;

	ind = true;
	_expr -> generate();
	_operand = _expr->_operand;
	cout <<"#end dereference ind" << endl;
}

void Dereference::generate(){
	cout <<"#dereference" << endl;

	_expr->generate();
	assignTemp(this);
	cout << "\tmovl \t" <<_expr <<", %eax" << endl;
	if (_type.size() == 1)
		cout << "\tmovsbl \t(%eax), %eax" << endl;
	else
		cout << "\tmovl \t (%eax), %eax" << endl;
	cout << "\tmovl \t%eax, " << this << endl;
	cout <<"#end dereference" << endl;
}

//what is this for?
void Promote::generate(){
	cout <<"#promote" << endl;

	cout  <<"\tmovb \t" << _expr << ", %al" << endl;
	cout <<"\tmovsb \t%al, %eax" << endl;
	assignTemp(this);
	cout <<"\tmovl \t%eax, " << this << endl;
}

//comparator generators
void LessThan::generate(){
	cout <<"#Less than" << endl;

	_left->generate();
	_right->generate();

	cout <<"\tmovl \t" << _left << ", %eax" << endl;
	cout << "\tcmpl \t"<< _right <<", %eax" << endl;
	cout << "\tsetl \t%al" << endl;
	cout << "\tmovzbl \t%al, %eax" << endl;
	assignTemp(this);
	cout <<"\tmovl %eax, " << this << endl;
	cout <<"#end Less than" << endl;
}

void GreaterThan::generate(){
	cout <<"#greater than" << endl;

	_left->generate();
	_right->generate();

	cout <<"\tmovl \t" << _left << ", %eax" << endl;
	cout << "\tcmpl \t"<< _right <<", %eax" << endl;
	cout << "\tsetg \t%al" << endl;
	cout << "\tmovzbl \t%al, %eax" << endl;
	assignTemp(this);
	cout <<"\tmovl %eax, " << this << endl;
	cout <<"#end greater than" << endl;

}

void LessOrEqual::generate(){
	cout <<"#less or equal" << endl;

	_left->generate();
	_right->generate();

	cout <<"\tmovl \t" << _left << ", %eax" << endl;
	cout << "\tcmpl \t"<< _right <<", %eax" << endl;
	cout << "\tsetle \t%al" << endl;
	cout << "\tmovzbl \t%al, %eax" << endl;
	assignTemp(this);
	cout <<"\tmovl %eax," << this << endl;
	cout <<"#end less or equal" << endl;

}

void GreaterOrEqual::generate(){
	cout <<"#greater or equal" << endl;

	_left->generate();
	_right->generate();

	cout <<"\tmovl \t" << _left << ", %eax" << endl;
	cout << "\tcmpl \t"<< _right <<", %eax" << endl;
	cout << "\tsetge \t%al" << endl;
	cout << "\tmovzbl \t%al, %eax" << endl;
	assignTemp(this);
	cout <<"\tmovl %eax, " << this << endl;
	cout <<"#end greater or equal" << endl;

}

void Equal::generate(){
	cout <<"#equal" << endl;

	_left -> generate();
	_right -> generate();

	cout <<"\tmovl \t" << _left << ", %eax" << endl;
	cout << "\tcmpl \t"<< _right <<", %eax" << endl;
	cout << "\tsete \t%al" << endl;
	cout << "\tmovzbl \t%al, %eax" << endl;
	assignTemp(this);
	cout <<"\tmovl \t%eax, " << this << endl;
	cout <<"#end equal" << endl;

}

void NotEqual::generate(){
	cout <<"#not equal" << endl;
	assignTemp(this);

	_left->generate();
	_right->generate();

	cout <<"\tmovl \t" << _left << ", %eax" << endl;
	cout << "\tcmpl \t"<< _right <<", %eax" << endl;
	cout << "\tsetne \t%al" << endl;
	cout << "\tmovzbl \t%al, %eax" << endl;
	assignTemp(this);
	cout <<"\tmovl \t%eax, " << this << endl;
	cout <<"#end not equal" << endl;

}

void LogicalAnd::generate(){
	Label *EXIT = new Label();
	assignTemp(this);

	// code for left
	cout << "#logical and left" << endl;
	_left->generate();
	cout << "\tmovl \t" << _left << ", %eax" << endl;
	cout <<"\tcmpl \t $0, %eax" << endl;
	cout <<"\tje \t"<< *EXIT << endl;

	//code for right
	cout << "#logical and left" << endl;
	_right->generate();
	cout << "\tmovl \t" << _right << ", %eax" << endl;
	cout << "\tcmpl $0, %eax" << endl;
	cout <<"\tje \t"<< *EXIT << endl;

	cout << *EXIT << ":"<< endl;
	cout << "\tsetne \t%al" << endl;
	cout << "\tmovzbl \t%al, %eax" << endl;
	cout << "\tmovl \t%eax, " << this << endl;
	cout << "#end logical and" << endl;
}

void LogicalOr::generate(){
	Label *EXIT = new Label();
    assignTemp(this);

	// code for left
	cout << "#logical or left" << endl;
	_left->generate();
	cout << "\tmovl \t" << _left << ", %eax" << endl;
	cout <<"\tcmpl \t $0, %eax" << endl;
	cout <<"\tjne \t"<< *EXIT << endl;

	//code for right
	cout << "#logical or right" << endl;
	_right->generate();
	cout << "\tmovl \t" << _right << ", %eax" << endl;
	cout << "\tcmpl $0, %eax" << endl;

	//false  into eax
	cout << *EXIT << ":"<< endl;
	cout << "\tsetne \t%al" << endl;
    cout << "\tmovzbl \t%al, %eax" << endl;
	cout << "\tmovl \t%eax, " << this << endl;
	cout << "#end logical or" << endl;
}

//implementing if, while, for, and break
//use labels for early returns -- possibly done with return::gen alredy
//code for loops found in slides 11/12 and 12/12

void While::generate(){
	cout << "#while" << endl;
	Label *LOOP = new Label();//set new label
	Label *EXIT = new Label();//set new label
	break_into.push_back(EXIT);

	cout << *LOOP << ":"<< endl;
    //code for expr
	cout <<"#comparing" << endl;
	_expr->generate();// teset compare
    cout <<"\tmovl \t" << _expr << ", %eax" << endl;
    cout <<"\tcmpl \t$0, %eax" << endl;
    cout <<"\tje \t" << *EXIT << endl;//?
    //code for STMT
	_stmt->generate();
    cout << "\tjmp \t "<< *LOOP << endl;
	cout << *EXIT<< ":" << endl;
	cout <<"#end while" << endl;
	break_into.pop_back();
}

void For::generate(){
	cout <<"#for" << endl;
	Label *LOOP = new Label();//set new label
	Label *EXIT = new Label();//set new label
	break_into.push_back(EXIT);

	cout <<"#initializing" << endl;
	_init->generate();//initialize
	cout << *LOOP<< ":" << endl;
	cout <<"#comparing" << endl;
	_expr->generate();//test compare
	cout <<"\tmovl \t" << _expr << ", %eax" << endl;
    cout <<"\tcmpl \t$0, %eax" << endl;
    cout <<"\tje \t" << *EXIT<< endl;//? stop  if false
	cout <<"#excecuting body" << endl;
	_stmt->generate();//do body
	cout <<"#incrementing" << endl;
	_incr->generate();	
	cout <<"\tjmp \t" << *LOOP << endl;
	cout << *EXIT<< ":" << endl;
	cout <<"#end for" << endl;
	break_into.pop_back();
}

void If::generate(){
	cout << "#IF" << endl;
	Label *ELSE = new Label();	
	Label *EXIT = new Label();	

	_expr->generate();
	cout << "\tmovl \t" << _expr << ", %eax" << endl;
	cout <<"\tcmpl \t$0, %eax" << endl;
	if (_elseStmt != nullptr)
		cout <<"\tje \t"<< *ELSE << endl;
	else
		cout <<"\tje \t"<< *EXIT << endl;
	_thenStmt->generate();
	cout <<"\tjmp \t" << *EXIT << endl;

	if (_elseStmt != nullptr){
		cout << "#ELSE" << endl;
		cout << *ELSE << ":"<< endl;
		_elseStmt->generate();//do body
		cout << "#end ELSE" << endl;
	}
	
	cout << *EXIT << ":"<< endl;//end if
	cout << "#end IF" << endl;
}

void Break::generate(){
	cout <<"#break" << endl;
	cout << "\tjmp \t" << *(break_into.back() )<<endl; 
	cout <<"#end break" << endl;
}
	

