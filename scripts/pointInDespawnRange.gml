var xx = argument0;
var yy = argument1;

// Find the center of the chunk the player is in
//var playerchunkx=floor(oPlayer.x/chunkSize)*chunkSize+chunkSize/2;
//var playerchunky=floor(oPlayer.y/chunkSize)*chunkSize+chunkSize/2;
var playerchunkx=oPlayer.x;
var playerchunky=oPlayer.y;


//var d = point_distance(playerchunkx,playerchunky,xx,yy);
//return d > seeRadius;
var dx=abs(xx-playerchunkx);
var dy=abs(yy-playerchunky);
if((dx>room_width/2+(hideEdges+.5)*chunkSize)||(dy>room_height/2+(hideEdges+.5)*chunkSize)){
    return 1;
}
else{
return 0;
}
