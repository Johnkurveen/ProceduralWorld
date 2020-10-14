var zz = argument0;
var r=0,b=0,g=0;

var shore=1; // shore offset

//var waterLevel = 45;

if(zz < waterLevel){
    b = 50 + (zz / waterLevel) * 200;
}
else if(zz <= waterLevel+shore){ // Makes shore blocks sandy
    r=194;
    g=178;
    b=128;
}
else if(zz = 102){ // Mark towns
    g = 25;
    b = 20;
    r = 250;
}
else if(zz = 101){ // Mark towns
    g = 25;
    b = 20;
    r = 50;
}


else if(zz > 75){ // For mountain tops
    g = 155+(zz-75)*100/(100-75);
    b = 155+(zz-75)*100/(100-75);
    r = 155+(zz-75)*100/(100-75);
    
}

else if(zz > waterLevel+shore){
    g = 50 + ((zz - waterLevel) / (100-waterLevel)) * 200
}

return make_color_rgb(r,g,b);
