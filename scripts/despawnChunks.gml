var px = oPlayer.x;
var py = oPlayer.y;
var i, j;
var v, tempID;

// Radius of most chunks visible, in pixels
var chunkx = chunkSize * (floor((room_width/2)/chunkSize)+hideEdges);
var chunky = chunkSize * (floor((room_height/2)/chunkSize)+hideEdges);


// Handles negative coordinates
if(px<0){
    px-=chunkSize;
}
if(py<0){
    py-=chunkSize;
}


px -= px % chunkSize; // Origin of current chunk
py -= py % chunkSize;



// Scan X direction
if(moveX!=0){
    for(v=1; v<=2; v++){
        i=px - (chunkx+v*chunkSize)*sign(moveX);
        for( j = py - chunky-chunkSize; j <= py + chunky+chunkSize; j+= chunkSize){
            tempID=chunkLoaded(i,j);
            if(tempID){
                instance_destroy(tempID, true);
            }
        }
    }
}


// Scan Y direction
if(moveY!=0){
    for(v=1; v<=2; v++){
        j=py - (chunky+v*chunkSize)*sign(moveY);
        for( i = px - chunkx; i <= px + chunkx; i+= chunkSize){
            tempID=chunkLoaded(i,j);
            if(tempID){
                instance_destroy(tempID, true);
            }
        }
    }
}

