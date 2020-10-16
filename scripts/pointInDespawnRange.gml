var xx = argument0;
var yy = argument1;

// Find the center of the chunk the player is in
//var px=floor(oPlayer.x/chunkSize)*chunkSize+chunkSize/2;
//var py=floor(oPlayer.y/chunkSize)*chunkSize+chunkSize/2;
var px=oPlayer.x;
var py=oPlayer.y;
if(px<0){
    px-=chunkSize;
}
if(py<0){
    py-=chunkSize;
}
px -= px % chunkSize; // Origin of current chunk
py -= py % chunkSize;
xx -= xx % chunkSize; // Origin of chunk in question
yy -= yy % chunkSize;


//var d = point_distance(px,py,xx,yy);
//return d > seeRadius;
var dx=abs(xx-px)+1;
//var dy=abs(yy-py);
var dy=abs(yy-py)+1;
if((dx>=room_width/2+(hideEdges+1)*chunkSize)||(dy>=room_height/2+(hideEdges+1)*chunkSize)){
    return 1;
}
else{
return 0;
}
