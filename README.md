#Rshell Command Shell

## Synopsis

The rshell program runs a Linux style command prompt which allows for the input of a single command or multiple commands utilizing semicolon, &&, or || as command connectors. The shell also allows, just as a basic Linux shell would, the input of paranthesis and the test command. Once the commands are entered they are executed in the order in which they were read and according to their command connectors and paranthesis precedence. Rshell also has the ability to handle pipes and redirectors along with any files within the existing directory. If and when a command fails rshell is designed to output and error message and return to the command prompt.

Some Examples of command input style:

```
$ command [arguments] [connector]
$ command [arguments] [connector] command [arguments]
$ (command [arguments] [connector] command [arguments] [connectors]) [connector] (command [arguments] [connector] command [arguments] [connectors])
```

## Code Example

Our code is constructed of vectors and objects which reads and executes shell commands in the following manner:

The following is example code which we used to parse the user input.
```
void parsQ(string s, queue<string>& cmds){   
    string tmpStr;
    
    char_separator<char> sep(";||&&");
    typedef tokenizer<char_separator<char> > mytok;
    typedef mytok::iterator tok_it;
    mytok tok(s, sep);
    
     for(tok_it i= tok.begin(); i != tok.end(); i++) {
    
        tmpStr = *i;
        
        //CHECKS IF STRING IS EMPTY
        if(tmpStr == " "){
            continue;
        }
        
        
         //Trims Leading space from string
        if (tmpStr[0] == ' '){
            tmpStr.erase(0,1);  
        }
        
        chkExit(tmpStr);//CHECKING FOR EXIT
        deleteCommentAfterHack(tmpStr);//CHECK COMMENT HASH #
        
        cmds.push(tmpStr);
        
    }
    
    tmpStr = "";
    
}
```

## Installation

The following are instructions for installing and running rshell
```
1. $ git clone  https://github.com/victormedel/rshell.git
2. $ cd rshell
3. $ git checkout hw2
4. $ make
5. $ bin/rshell
```

## Tests

This Assignment required the creation of four test shell scripts which would handle the testing of the code. The following shell scripts have been created to test specific areas of the code.
```
single_command.sh	 	-Tests for single command inputs	
multi_command.sh		-Tests for multiple command inputs
commented_command.sh	-Tests for commented  inputs
exit.sh					-Test for the exit command within the application
paranthesis.sh			-Test for commands within paranthesis
test_command.sh			-Test for the test diffrent variation of the test command
pipes.sh				-Test for commands combined with pipes
redirector.sh			-Test for commands with redirectors <, >, and >>.
```

## Features


Known "feature to rshell is that it requires multiple input of exit from time to time."


## Contributors

Assignment was completed by:
```
Alex Candia
Victor Medel
```

## License

The GNU General Public License is a free, copyleft license for software and other kinds of works.