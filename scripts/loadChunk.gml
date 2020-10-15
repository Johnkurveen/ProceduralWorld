var i;
var hasTown;
chunkData=ds_list_create();
terrainGrids=ds_list_create(); // list of 2D arrays, making a 3D array
resourceGrids=ds_list_create();
townGeneration=ds_list_create(); // 1D list of town attributes; max ranking, location x, location y
townID=0; // Stores 0 for no town, or town's ID/key. Town stores location and resources
for (i=0; i<TERRAIN; i++){
    terrainGrids[| i]=ds_grid_create(chunkSize/blockSize, chunkSize/blockSize);
}
for (i=0; i<RESOURCES+2; i++){
    resourceGrids[| i]=ds_grid_create(chunkSize/blockSize, chunkSize/blockSize);
}

//testing=ds_list_create();
//testing[| 0]=ds_grid_create(chunkSize/blockSize, chunkSize/blockSize);
//testing[| 1]=ds_grid_create(chunkSize/blockSize, chunkSize/blockSize);


//grid = ds_grid_create(chunkSize/blockSize, chunkSize/blockSize);
//grid2 = ds_grid_create(chunkSize/blockSize, chunkSize/blockSize);
//grid=testing[| 0];


if(chunkExists(x,y)){// Reads the grid-specific data saved by unloadChunk

    for (i=0; i<TERRAIN; i++){
        ds_grid_read(terrainGrids[| i],ds_map_find_value(terrainMap[| i],getKey(x,y)));
    }
    for (i=0; i<RESOURCES+2; i++){
        ds_grid_read(resourceGrids[| i],ds_map_find_value(resourceMap[| i],getKey(x,y)));
    }
    
    for (i=0; i<2; i++){
        ds_list_read(chunkData,ds_map_find_value(chunkDataMap,getKey(x,y)));
    }
    //var str = ds_map_find_value(chunkMap,getKey(x,y));
    //ds_grid_read(testing[| 0],ds_map_find_value(chunkMap[| 0],getKey(x,y)));
    //ds_grid_read(testing[| 1],ds_map_find_value(chunkMap[| 1],getKey(x,y)));
    
}else{
    generate();
}

//print(id);
ds_map_add(chunkLoadedSet,getKey(x,y),id); // Holds the unique ID of each instance, with x/y key. Used to check if loaded
