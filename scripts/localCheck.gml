//Checks a circle or r=2 around a town chunk to make sure no other towns are too close
var tempID;
var px=x, py=y;

px -= px % chunkSize;
py -= py % chunkSize;


for(var xx = -2; xx <= 2; xx++){
    for(var yy = -2; yy <= 2; yy++){
        // Skips the corners and the center chunk
        if((abs(xx)+abs(yy))=4||(xx=0&&yy=0)){
            continue;
        }
        tempID=chunkLoaded(px+xx*chunkSize,py+yy*chunkSize);
        // Skip unloaded chunks
        if(tempID==0){
            continue;
        }
        // If a nearby grid has a town, increase its teir and set own town to 0. 
        if(tempID.chunkData[| 0]==1){
            tempID.chunkData[| 1]++;
            chunkData[| 0]=0;
            townsNumber[| tempID.chunkData[| 1]]++;
            townsNumber[| tempID.chunkData[| 1]-1]--;
        }
            
        /*for(var i = 0; i < chunkSize / blockSize; i++){
            for(var j = 0; j < chunkSize / blockSize; j++){
                // Can be shown to display hastown chunks
                ds_grid_set(terrainGrids[| 0], i, j, 101);
            }
        }
        }*/
        //if(tempID.chunkData[| 0]==1){}
        
    }
}
if(chunkData[| 0]==1){
    townRank();
}
