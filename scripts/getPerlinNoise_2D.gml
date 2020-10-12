//Example call (resources)
// getPerlinNoise_2D(x / blockSize + i,y / blockSize + j, v, v+1, test);

var xx = argument[0];
var yy = argument[1];
var range;
var layer = argument[2]; // Layer number (for terrain mostly)
var resource = 0;
var resolution=8; // How many layers to add
var sampleDelta = mapScale; // This is basically the starting frequency. 32
// Larger numbers produce larger features
switch(argument_count){
    case 5:
        sampleDelta=argument[4];
    case 4:
        resource=argument[3];
        if (resource>0){ // Then this is a resource to map
            resolution=ds_grid_get(res_constant,4,resource-1);
            sampleDelta=ds_grid_get(res_constant,3,resource-1);
        }
}

// This will map the range such that the series can produce almost 100
switch(resolution){ 
case 1:
    range=200;
    break;
case 2:
    range=133;
    break;
case 3:
    range=114;
    break;
case 4:
    range=105;
    break;
default:
    range=100;
}
range= range div 2;
var noise = 0;


//range = range div 2;

while(sampleDelta > 0&&resolution>0){
    var index_x = xx div sampleDelta; // Resolution increases per loop
    var index_y = yy div sampleDelta; // Index increases
    
    var t_x = (abs(xx) % sampleDelta) / sampleDelta; // 0-1 
    var t_y = (abs(yy) % sampleDelta) / sampleDelta;
    
    if(sign(xx) == -1){t_x = 1 - t_x; index_x--;} // Handles negative numbers
    if(sign(yy) == -1){t_y = 1 - t_y; index_y--;} // Offsets by -1 for consistancy
    
    var r_00 = randomSeed(range,index_x  , index_y  , layer, resource); // Calculates random points 
    var r_01 = randomSeed(range,index_x  , index_y+1, layer, resource);
    var r_10 = randomSeed(range,index_x+1, index_y  , layer, resource);
    var r_11 = randomSeed(range,index_x+1, index_y+1, layer, resource);
    
    var r_0 = lerp(r_00,r_01,t_y);  // Linearly interprolates between the points
    var r_1 = lerp(r_10,r_11,t_y);  // One interprolation per axis?
    
    noise += lerp(r_0,r_1,t_x);
    
    sampleDelta = sampleDelta div 2; // Gets smaller each loop
    range = range div 2;
    range = max(1,range); // Avoids 0
    resolution--;
}

return round(noise);
