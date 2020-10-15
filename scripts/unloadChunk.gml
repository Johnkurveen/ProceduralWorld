ds_map_delete(chunkLoadedSet,getKey(x,y));

//Saves the grid info as a string to chunkMap, for loadChunk
for (var i=0; i<TERRAIN; i++){
    ds_map_replace(terrainMap[| i],getKey(x,y), ds_grid_write(terrainGrids[| i]));
    ds_grid_destroy(terrainGrids[| i]);
}
for (i=0; i<RESOURCES+2; i++){
    ds_map_replace(resourceMap[| i],getKey(x,y), ds_grid_write(resourceGrids[| i]));
    ds_grid_destroy(resourceGrids[| i]);
}

for (i=0; i<2; i++){
    ds_map_replace(chunkDataMap, getKey(x,y), ds_list_write(chunkData));
    //ds_list_destroy(chunkData);
}



//ds_map_replace(chunkMap[| 1],getKey(x,y), ds_grid_write(testing[| 1]));


