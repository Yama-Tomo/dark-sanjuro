class CalcsController < ApplicationController
  def calc
    @calc = Calc.new 
  end
 
  def exec_calc 
    @calc = Calc.new params[:calc]

    # 減衰値を計算
    @attenuation = ((@calc.relay_distance.to_f * 0.5) + (@calc.building_num.to_f) + (@calc.admission_distance.to_f * 0.5) + (@calc.connector_num.to_f))

    @media_converters = MediaConverter.where(["bandwidth = ? AND trans_lost_from <= ? AND trans_lost_to >= ?", @calc.bandwidth, @attenuation, @attenuation])
                                      .order("bandwidth DESC, manufacturer ASC, name ASC")
  end
end


