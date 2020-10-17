var px = oPlayer.x;
var py = oPlayer.y;

var corners;//, topRight, topLeft, bottomRight, bottomLeft;
globalvar moved;
moved=0;
corners=ds_list_create();

if(px<0){
    px-=chunkSize;
}
if(py<0){
    py-=chunkSize;
}

px -= px % chunkSize; // Origin of current chunk
py -= py % chunkSize;


// Radius of most chunks visible, in pixels
var chunkx = chunkSize * (floor((room_width/2)/chunkSize)+hideEdges);
var chunky = chunkSize * (floor((room_height/2)/chunkSize)+hideEdges);
//var chunkx = (((room_width/2)) + chunkSize*hideEdges);
//var chunky = (((room_height/2))+ chunkSize*hideEdges);

corners[| 0]=!chunkLoaded(px - chunkx, py - chunky);
corners[| 1]=!chunkLoaded(px + chunkx-chunkSize, py - chunky+chunkSize);
corners[| 2]=!chunkLoaded(px - chunkx+chunkSize, py + chunky-chunkSize);
corners[| 3]=!chunkLoaded(px + chunkx-chunkSize, py + chunky-chunkSize);

//print(getKey((px - chunkx+chunkSize)*chunkSize, (py + chunky-chunkSize)*chunkSize));


for(var i=0; i<4; i++){
    moved+=corners[| i];
}
print(moved);
//if(moved){




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


//}
