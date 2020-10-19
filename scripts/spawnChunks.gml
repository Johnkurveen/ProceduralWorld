var px = oPlayer.x;
var py = oPlayer.y;


// Radius of most chunks visible, in pixels
var chunkx = chunkSize * (floor((room_width/2)/chunkSize)+hideEdges);
var chunky = chunkSize * (floor((room_height/2)/chunkSize)+hideEdges);

/* // Used to draw a box around the player showing where chunks are generated
corners[| 0]=(px + chunkx);
corners[| 1]=(py - chunky);
corners[| 2]=(px - chunkx);
corners[| 3]=(py + chunky);*/

// Handles negative coordinates
if(px<0){
    px-=chunkSize;
}
if(py<0){
    py-=chunkSize;
}


px -= px % chunkSize; // Origin of current chunk
py -= py % chunkSize;

// Scan all visible chunks to see if they exist
for(var i = px - chunkx; i <= px + chunkx-chunkSize*0; i+= chunkSize){
    for(var j = py - chunky; j <= py + chunky-chunkSize*0; j+= chunkSize){
      if(!chunkLoaded(i,j) /*&& pointInSpawnRange(i+chunkSize/2,j+chunkSize/2)*/){
        instance_create(i,j,oChunk);
      }
    }
}


