#! /bin/bash

sqlite3 neurovault.sqlite3 <<"EOF"
CREATE TABLE IF NOT EXISTS "statmaps_statisticmap" (
"image_ptr_id" INTEGER REFERENCES statmaps_basecollectionitem(id),
  "map_type" TEXT,
  "statistic_parameters" REAL,
  "smoothness_fwhm" REAL,
  "contrast_definition" TEXT,
  "contrast_definition_cogatlas" TEXT,
  "modality" TEXT,
  "cognitive_paradigm_cogatlas_id" TEXT,
  "ignore_file_warning" TEXT,
  "is_thresholded" TEXT,
  "perc_bad_voxels" REAL,
  "brain_coverage" REAL,
  "not_mni" TEXT,
  "perc_voxels_outside" REAL,
  "analysis_level" TEXT,
  "cognitive_contrast_cogatlas_id" TEXT,
  "number_of_subjects" REAL,
  "cognitive_paradigm_description_url" TEXT
);
CREATE TABLE IF NOT EXISTS "statmaps_basecollectionitem" (
"id" INTEGER PRIMARY KEY,
  "name" TEXT,
  "description" TEXT,
  "add_date" TEXT,
  "modify_date" TEXT,
  "collection_id" INTEGER REFERENCES statmaps_collection(id),
  "polymorphic_ctype_id" INTEGER,
  "is_valid" TEXT
);
CREATE TABLE IF NOT EXISTS "statmaps_atlas" (
"image_ptr_id" INTEGER REFERENCES statmaps_basecollectionitem(id),
  "label_description_file" TEXT
);
CREATE TABLE IF NOT EXISTS "statmaps_collection_communities" (
"id" INTEGER,
"collection_id" INTEGER REFERENCES statmaps_collection(id),
  "community_id" INTEGER
);
CREATE TABLE IF NOT EXISTS "statmaps_cognitiveatlascontrast" (
"name" TEXT,
  "cog_atlas_id" TEXT,
  "task_id" TEXT
);
CREATE TABLE IF NOT EXISTS "statmaps_community" (
"id" INTEGER,
  "label" TEXT,
  "short_desc" TEXT
);
CREATE TABLE IF NOT EXISTS "statmaps_cognitiveatlastask" (
"name" TEXT,
  "cog_atlas_id" TEXT
);
CREATE TABLE IF NOT EXISTS "statmaps_collection_contributors" (
"id" INTEGER PRIMARY KEY,
  "collection_id" INTEGER REFERENCES collection_id(id),
  "user_id" INTEGER
);
CREATE TABLE IF NOT EXISTS "statmaps_collection" (
"id" INTEGER PRIMARY KEY,
  "name" TEXT,
  "DOI" TEXT,
  "authors" TEXT,
  "paper_url" TEXT,
  "description" TEXT,
  "private" TEXT,
  "private_token" TEXT,
  "add_date" TEXT,
  "modify_date" TEXT,
  "type_of_design" TEXT,
  "number_of_imaging_runs" REAL,
  "number_of_experimental_units" REAL,
  "length_of_runs" REAL,
  "length_of_blocks" REAL,
  "length_of_trials" TEXT,
  "optimization" TEXT,
  "optimization_method" TEXT,
  "subject_age_mean" REAL,
  "subject_age_min" REAL,
  "subject_age_max" REAL,
  "handedness" TEXT,
  "proportion_male_subjects" REAL,
  "inclusion_exclusion_criteria" TEXT,
  "number_of_rejected_subjects" REAL,
  "group_comparison" TEXT,
  "group_description" TEXT,
  "scanner_make" TEXT,
  "scanner_model" TEXT,
  "field_strength" REAL,
  "pulse_sequence" TEXT,
  "parallel_imaging" TEXT,
  "field_of_view" REAL,
  "matrix_size" REAL,
  "slice_thickness" REAL,
  "skip_distance" REAL,
  "acquisition_orientation" TEXT,
  "order_of_acquisition" TEXT,
  "repetition_time" REAL,
  "echo_time" REAL,
  "flip_angle" REAL,
  "software_package" TEXT,
  "software_version" TEXT,
  "order_of_preprocessing_operations" TEXT,
  "quality_control" TEXT,
  "used_b0_unwarping" TEXT,
  "b0_unwarping_software" TEXT,
  "used_slice_timing_correction" TEXT,
  "slice_timing_correction_software" TEXT,
  "used_motion_correction" TEXT,
  "motion_correction_software" TEXT,
  "motion_correction_reference" TEXT,
  "motion_correction_metric" TEXT,
  "motion_correction_interpolation" TEXT,
  "used_motion_susceptibiity_correction" TEXT,
  "used_intersubject_registration" TEXT,
  "intersubject_registration_software" TEXT,
  "intersubject_transformation_type" TEXT,
  "nonlinear_transform_type" TEXT,
  "transform_similarity_metric" TEXT,
  "interpolation_method" TEXT,
  "object_image_type" TEXT,
  "functional_coregistered_to_structural" TEXT,
  "functional_coregistration_method" TEXT,
  "coordinate_space" TEXT,
  "target_template_image" TEXT,
  "target_resolution" REAL,
  "used_smoothing" TEXT,
  "smoothing_type" TEXT,
  "smoothing_fwhm" REAL,
  "resampled_voxel_size" REAL,
  "intrasubject_model_type" TEXT,
  "intrasubject_estimation_type" TEXT,
  "intrasubject_modeling_software" TEXT,
  "hemodynamic_response_function" TEXT,
  "used_temporal_derivatives" TEXT,
  "used_dispersion_derivatives" TEXT,
  "used_motion_regressors" TEXT,
  "used_reaction_time_regressor" TEXT,
  "used_orthogonalization" TEXT,
  "orthogonalization_description" TEXT,
  "used_high_pass_filter" TEXT,
  "high_pass_filter_method" TEXT,
  "autocorrelation_model" TEXT,
  "group_model_type" TEXT,
  "group_estimation_type" TEXT,
  "group_modeling_software" TEXT,
  "group_inference_type" TEXT,
  "group_model_multilevel" TEXT,
  "group_repeated_measures" TEXT,
  "group_repeated_measures_method" TEXT,
  "owner_id" INTEGER,
  "journal_name" TEXT,
  "full_dataset_url" TEXT,
  "doi_add_date" TEXT,
  "nutbrain_food_choice_type" TEXT,
  "nutbrain_food_viewing_conditions" TEXT,
  "nutbrain_hunger_state" TEXT,
  "nutbrain_odor_conditions" TEXT,
  "nutbrain_taste_conditions" TEXT
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
"id" INTEGER,
  "app_label" TEXT,
  "model" TEXT
);
CREATE TABLE IF NOT EXISTS "statmaps_image" (
"file" TEXT,
  "figure" TEXT,
  "thumbnail" TEXT,
  "reduced_representation" TEXT,
  "data" TEXT,
  "basecollectionitem_ptr_id" INTEGER REFERENCES statmaps_basecollectionitem(id),
  "surface_left_file" TEXT,
  "surface_right_file" TEXT,
  "data_origin" TEXT,
  "subject_species" TEXT,
  "target_template_image" TEXT,
  "BMI" REAL,
  "age" REAL,
  "bis11_score" REAL,
  "bis_bas_score" REAL,
  "days_since_menstruation" REAL,
  "ethnicity" TEXT,
  "fat_percentage" REAL,
  "gender" TEXT,
  "handedness" TEXT,
  "hours_since_last_meal" REAL,
  "mean_PDS_score" REAL,
  "race" TEXT,
  "spsrq_score" REAL,
  "tanner_stage" TEXT,
  "waist_hip_ratio" REAL
);
EOF

find $(pwd) -name '*.csv' -exec sh -c 'for f do sqlite3 neurovault.sqlite3 ".import --skip 1 --csv $f $(basename $f .csv)"; done' find-sh {} +
