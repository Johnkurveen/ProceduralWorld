//var perlinmaps=ds_list_create(); // 0 = alt, 1, 2, etc = resources
var alt;
//var maximum=0;
var rank=0;
townGeneration[| 0]=0;
var threshold=70;
var hasTown=0;
random_set_seed(x+y*power(2,10));
if(random_range(1, 100)>=98){
    hasTown=1;
}
//var maxi, maxj;

// Generates the chunk by block
for(var i = 0; i < chunkSize / blockSize; i++){
    for(var j = 0; j < chunkSize / blockSize; j++){
        alt = getPerlinNoise_2D(x / blockSize + i,y / blockSize + j,0);
        ds_grid_set(terrainGrids[| 0], i, j, alt);
        for (var v=1; v<TERRAIN; v++){ // Starts at v=1 since altitude is done before this
            ds_grid_set(terrainGrids[| v], i, j, getPerlinNoise_2D(x / blockSize + i,y / blockSize + j,v));
        }
        for (var v=0; v<RESOURCES; v++){
            switch(ds_grid_get(res_constant,5,v)){ // Checks for water condition
            case 0:
                if (alt>=waterLevel){
                    ds_grid_set(resourceGrids[| v], i, j, getPerlinNoise_2D(x / blockSize + i,y / blockSize + j, v, v+1, test));
                }
                else{
                    ds_grid_set(resourceGrids[| v], i, j, 0);// In water, so rejects
                }
            break;
            
            case 1:
                if ((alt>=waterLevel)&&(alt<waterLevel+3)){
                    ds_grid_set(resourceGrids[| v], i, j, getPerlinNoise_2D(x / blockSize + i,y / blockSize + j, v, v+1, test));
                }
                else{
                    ds_grid_set(resourceGrids[| v], i, j, 0);
                }
                break;
                
            case 2:
                if (alt>=waterLevel+3){
                    ds_grid_set(resourceGrids[| v], i, j, getPerlinNoise_2D(x / blockSize + i,y / blockSize + j, v, v+1, test));
                }
                else{
                    ds_grid_set(resourceGrids[| v], i, j, 0);
                }
            break;
            default:
                ds_grid_set(resourceGrids[| v], i, j, 0);
            }
        }
        rank=0;
        for(v=0; v<RESOURCES; v++){
            rank+=ds_grid_get(resourceGrids[| v], i, j);
            
        }
        rank=rank*255/100/RESOURCES;
        
        if(rank>threshold&&townGeneration[| 0]<rank){
            townGeneration[| 0]=rank;
            townGeneration[| 1]=i;
            townGeneration[| 2]=j;
        }
        
    }
}
// Mark location of town
if(townGeneration[| 0]>threshold&&hasTown==1){
    /*for(v=0; v<RESOURCES; v++){
        ds_grid_set(resourceGrids[| v], townGeneration[| 1], townGeneration[| 2], 99);
    }*/
    ds_grid_set(terrainGrids[| 0], townGeneration[| 1], townGeneration[| 2], 101);
}
townRank();
ds_list_destroy(townGeneration);


