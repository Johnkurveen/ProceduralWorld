var range = argument[0];
var num = argument[1]; // x-axis

switch(argument_count){
    case 5:
        num +=argument[4]* 16536;  // Resource term
    case 4:
        num +=argument[3]* 165536; // layer number
    case 3:
        num +=argument[2]* 65536;  // y-axis
}

var seed = oGenerator.seed + num;

random_set_seed(seed);
rand = irandom_range(0,range);

return round(rand);
