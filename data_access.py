# ### Accessing NeuroVault Archived Data

# First, tar unzip the desired archive file:

# +
# #!tar -xvf november_2022.tar.gz
# -

# Next, we will load the files into pandas DataFrames:

import pandas as pd

# Load collections:

collections = pd.read_csv('november_2022/statmaps_statisticmap.csv')

collections.head()

# Now, we load the statistical images, which require merging several tables.
#
# In order to merge `StatisticMap` to `Image`, we need the table `BaseStatisticMap`

image = pd.read_csv('november_2022/statmaps_image.csv')
basecollectionitem = pd.read_csv('november_2022/statmaps_basecollectionitem.csv')
statisticmap = pd.read_csv('november_2022/statmaps_statisticmap.csv')

# `image` table is first merged to `basecollectionitem` using `basecollectionitem_ptr_id`:

image_merged = pd.merge(image, basecollectionitem, left_on='basecollectionitem_ptr_id', right_on='id')

# Next, the `statisticmap` table can be merged to `image` using `image_ptr_id', which corresponds to 'basecollectionitem_ptr_id'

statisticmap_merged = pd.merge(statisticmap, image_merged, left_on='image_ptr_id', right_on='basecollectionitem_ptr_id')

statisticmap_merged.head()
