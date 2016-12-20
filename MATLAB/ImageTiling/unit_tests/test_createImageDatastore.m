% Testing createImageDatastore.m

%% parameters
base_path = 'C:\Projects\DynaSlum\Data\Kalyan\Datasets\';
tile_sizes = [417 333 250 167 83];
tile_sizes_m = [250 200 150 100 50];

num_datasets = length(tile_sizes);

summary_flag = true;
preview_flag = false;

save_flag = true;

%% create image datastore and show summary and sample of the 4 classes
for n = 1: num_datasets
    disp(['Creating image data store # ', num2str(n), ' out of ', ...
        num2str(num_datasets)]);
    tile_size = tile_sizes(n);
    tile_size_m = tile_sizes_m(n);
    str = ['px' num2str(tile_size) 'm' num2str(tile_size_m)];
    image_dataset_location = fullfile(base_path,str);
    [imds] = createImageDatastore( image_dataset_location, summary_flag,...
        preview_flag);
    if save_flag
        sav_file = fullfile(image_dataset_location, 'imds.mat');
        save(sav_file, 'imds');
    end
    disp('-----------------------------------------------------------------');
end
disp('DONE.');