var rank;
var rankMax=0, maxii, maxjj;
var resourceMax;
var cal;
var threshold=20;
bestofBlock=ds_list_create(); // Rank and coordinates of best ranking block for required teir
temp6=ds_list_create();
var teir=1; // 1->resources
var teirR;  // For teirs over 3, limits resources to top 3

random_set_seed(x*power(2,10)+y);
var townPop=random_range(0, 100);
//Teir 5 1.2%
if (townPop<5){ teirR=4; } //5%>8.6%
else if (townPop<15){ teirR=3; }// 10%>15.7%
else if (townPop<40){ teirR=2; }// 25%>23.9%
else { teirR=1; }// 60%>50.6%


//Loop through grid
for(var ii = 0; ii < chunkSize / blockSize; ii++){
    for(var jj = 0; jj < chunkSize / blockSize; jj++){
        if(ds_grid_get(terrainGrids[| 0], ii, jj)< waterLevel){
            continue;
        }
        // For each block, loop through resources and rank them
        for(vv=0; vv<RESOURCES; vv++){
            if(teir>3){
                cal=power(vv, 1/5)*(teir-3);
            }
            else{
                cal=1;
            }
            rank=ds_grid_get(resourceGrids[| vv], ii, jj)*ds_grid_get(res_constant, 7, vv)*(cal);
            ds_list_set(bestofBlock, vv, rank);
        }
        rank=0;
        /*if (teir>3){
            teirR=3;
        }
        else{
            teirR=teir;
        }*/
        ds_list_copy(temp6, bestofBlock)
        ds_list_sort(bestofBlock, false); // Sort list by highest rank
        // Take last layer used in the ranking- map that color
        ds_grid_set(resourceGrids[| RESOURCES+1], ii, jj, ds_list_find_index(temp6, bestofBlock[| teirR-1]));
        // Add top ranking resources depending on teir
        for(var zz=0; zz<teirR; zz++){
            rank+= bestofBlock[| zz];
        }
        cal=15;
        rank/=((teirR+2)*cal);
        ds_grid_set(resourceGrids[| RESOURCES], ii, jj, rank);
        
        if(rank>rankMax&&rank>threshold){
            rankMax=rank;
            maxii=ii;
            maxjj=jj;
        
        }

    }
}
if(rankMax>threshold){
    ds_grid_set(terrainGrids[| 0], maxii, maxjj, 101);
    //ds_grid_set(resourceGrids[| 0], maxii, maxjj, 100);
    chunkData[| 1]=teirR;
    townsNumber[| teirR]++;
}
else{
    chunkData[| 0]=0;
    chunkData[| 1]=0;
}



//Return max ranking block- value and coordinates
//bestofChunk
