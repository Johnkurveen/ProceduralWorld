var length, calc=3, i;
var cords, key;

length=ds_map_size(chunkBuffer);
calc+=length/5;

for(i=0; i<calc && length>0; i++){
    key=ds_map_find_first(chunkBuffer);
    cords=chunkBuffer[? key];
    if(!chunkLoaded(cords[0], cords[1])){
        instance_create(cords[0], cords[1], oChunk);
    }
    length--;
    ds_map_delete(chunkBuffer, key);
}

