var px = oPlayer.x;
var py = oPlayer.y;
var i, j;
var v;
var nearScreen;
var chunkCords, key;

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
if( moveX==5 && moveY==5){
    areaGenerate=0;

    for( i = px - chunkx; i <= px + chunkx-chunkSize*0; i+= chunkSize){
        for( j = py - chunky; j <= py + chunky-chunkSize*0; j+= chunkSize){
          if(!chunkLoaded(i,j)){ //&& pointInSpawnRange(i+chunkSize/2,j+chunkSize/2)
            instance_create(i,j,oChunk);
          }
        }
    }
    moveX=0; moveY=0;
    areaGenerate=1;
}

//moveX=1;
// Scan X direction
if(moveX!=0){
    for(v=0; v<2; v++){ // Two columns
        i=px + (chunkx-v*chunkSize)*sign(moveX);
        for( j = py - chunky; j <= py + chunky; j+= chunkSize){
          if(!chunkLoaded(i,j)){
            instance_create(i,j,oChunk);
          }
        }
    }
    i=px + (chunkx+chunkSize)*sign(moveX);
    for( j = py - chunky; j <= py + chunky; j+= chunkSize){
        key=getKey(i,j);
        if(!ds_map_exists(chunkBuffer, key) && !chunkLoaded(i,j) && !chunkExists(i,j)){
            chunkCords[0]=i;
            chunkCords[1]=j;
            ds_map_add(chunkBuffer, key, chunkCords);
        }
    }
    
    
}


// Scan Y direction
if(moveY!=0){
    for(v=0; v<2; v++){ // Two rows
        j=py + (chunky-v*chunkSize)*sign(moveY);
        for( i = px - chunkx; i <= px + chunkx; i+= chunkSize){
            if(!chunkLoaded(i,j)){
                instance_create(i,j,oChunk);
            }
        }
    }
    j=py + (chunky+chunkSize)*sign(moveY);
    for( i = px - chunkx; i <= px + chunkx; i+= chunkSize){
        key=getKey(i,j);
        if(!ds_map_exists(chunkBuffer, key) && !chunkLoaded(i,j) && !chunkExists(i,j)){
            chunkCords[0]=i;
            chunkCords[1]=j;
            ds_map_add(chunkBuffer, key, chunkCords);
        }
    }
}

// Generates a large area around a player, useful for generating nearby towns. Area 32x32 chunks
if(areaGenerate){
    for( i = px - distantGenerate*chunkSize; i <= px + distantGenerate*chunkSize; i+= chunkSize){
        if(i>=px - chunkx && i<=px + chunkx){
            nearScreen=1; // Used to skip chunks on screen
        }
        else{
            nearScreen=0;
        }
        for( j = py - distantGenerate*chunkSize; j <= py + distantGenerate*chunkSize; j+= chunkSize){
            if(j==py - chunky && nearScreen){
                j=py + chunky; // Skips chunks on screen
            }
            if(!chunkLoaded(i,j)&&!chunkExists(i,j)){ // One checks currently loaded, other checks memory 
                instance_create(i,j,oChunk);
                instance_destroy(chunkLoadedSet[? getKey(i,j)], true); // Destoy it to save it to memory
            }
        }
    }
    areaGenerate=0; // Resets flag so it only runs once
}

genBuffer();
