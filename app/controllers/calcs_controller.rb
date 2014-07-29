class CalcsController < ApplicationController
  def calc
    @calc = Calc.new 

    # フォームデフォルト値を設定
    @calc.relay_distance_attenuation          = 0.5
    @calc.connector_num_per_builing           = 2
    @calc.bilding_num_attenuation             = 0.5
    @calc.admission_distance_attenuation      = 0.5
    @calc.start_and_end_point_num_attenuation = 0.5
    @calc.start_and_end_point_num             = 2
  end
 
  def exec_calc 
    @calc = Calc.new params[:calc]

    # 減衰値を計算
    @attenuation = ((@calc.relay_distance.to_f * @calc.relay_distance_attenuation.to_f) \
                 + (@calc.building_num.to_f * @calc.connector_num_per_builing.to_f * @calc.bilding_num_attenuation.to_f) \
                 + (@calc.admission_distance.to_f * @calc.admission_distance_attenuation.to_f) \
                 + (@calc.start_and_end_point_num_attenuation.to_f * @calc.connector_num.to_f * @calc.start_and_end_point_num.to_f))

    @media_converters = MediaConverter.where(["bandwidth = ? AND trans_lost_from <= ? AND trans_lost_to >= ?", @calc.bandwidth, @attenuation, @attenuation])
                                      .order("bandwidth DESC, manufacturer ASC, name ASC")
  end
end


