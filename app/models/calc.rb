# -*- coding: utf-8 -*-
class Calc < NonActiveRecord::Base
  attr_accessor :relay_distance, :building_num, :admission_distance, :connector_num, :bandwidth,
                :relay_distance_attenuation, :bilding_num_attenuation, :connector_num_per_builing, :admission_distance_attenuation,
                :start_and_end_point_num, :start_and_end_point_num_attenuation
end

