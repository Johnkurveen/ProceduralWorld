var xx = argument0;
var yy = argument1;

var tempID=chunkLoadedSet[? getKey(xx,yy)];
//return ds_map_exists(chunkLoadedSet,getKey(xx,yy));
if(is_undefined(tempID)){
    tempID=0;
}
//print(tempID);
return tempID;
