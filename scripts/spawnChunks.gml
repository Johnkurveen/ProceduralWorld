var px = oPlayer.x;
var py = oPlayer.y;

px -= px % chunkSize; // Origin of current chunk
py -= py % chunkSize;



// Radius of most chunks visible, in pixels
var chunkx = chunkSize * (ceil((room_width/2)/chunkSize)+hideEdges);
var chunky = chunkSize * (ceil((room_height/2)/chunkSize)+hideEdges);

/*
for(var i = px - chunkx; i <= px + chunkx; i+= chunkSize){
    for(var j = py - chunky; j <= py + chunky; j+= chunkSize){
      if(!chunkLoaded(i,j) && pointInSpawnRange(i+chunkSize/2,j+chunkSize/2)){
        instance_create(i,j,oChunk);
      }
    }
}*/

for(var i = px - chunkx; i <= px + chunkx; i+= chunkSize){
    for(var j = py - chunky; j <= py + chunky; j+= chunkSize){
      if(!chunkLoaded(i,j) && pointInSpawnRange(i+chunkSize/2,j+chunkSize/2)){
        instance_create(i,j,oChunk);
      }
    }
}



