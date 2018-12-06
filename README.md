## Instructions:

### Link to progressive gan code:
https://github.com/tkarras/progressive_growing_of_gans

**Pre-req**: You must have all images in one folder. Each image in dataset MUST have a resolution of 2 powers. E.g. 32x32, 64x64, 128x128, 256x256, 512x512.

**Note**: If you need to pre-process data, feel free to use "dataset_processing.ipynb" notebook. Follow comments in notebook on how to use.

1. Run ./docker.sh
2. Let's have dataset in 'data_files' folder. Our dataset has 16 categories. So I used 'Booties' category to test pg-gan.
3. Prepare dataset. Following step will create a folder 'tf_data'
```bash
    > python dataset_tool.py create_from_images --shuffle 1 tf_data data_files/Booties
```
4. Edit 'config.py'. Make following changes:
   - data_dir = ''
   - result_dir = 'results'
   - Add this line in Dataset section:
            desc += '-shoedata';             dataset = EasyDict(tfrecord_dir='tf_data'); train.mirror_augment = True
   - In config presets section uncomment relevant line depending on number of GPUs you are using:
      - desc += '-preset-v2-1gpu' => for 1 GPUs
      - desc += '-preset-v2-4gpus' => for 4 GPUs
      - desc += '-preset-v2-8gpus' => for 8 GPUs

    Note: Feel free to explore other options depending on your requirement.

5. Run "python train.py"

(OPTIONAL)
1. If you are trying to generate video of results. Make sure to install ImageMagick and GhostScripts(Will be adding detailed steps soon).
## Troubleshooting:

1. If you come across 'could not create cudnn handle: CUDNN_STATUS_INTERNAL_ERROR'. This indicates cudnn version is incompatible.
