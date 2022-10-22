sub a { 
    print 'A';
    return $_[0] 
 }
sub b { 
    print 'B';
    return $_[0] 
 }

sub short_circuit {
    
    for my $and ('&&') {
        #the values in qw array are is 1 for truth and 0 for false
        for (qw(1,1 1,0 0,1 0,0)) {
           my ($x,$y) = /(.),(.)/;
           print my $str = "a($x) $and b($y)", ': ';
           # evaluate the variable $str in order to know if it was T or F
           # and which variable AKA statement was evaluated
           print eval $str; 
           print "\n"; 
        } 
    }
}    

short_circuit();