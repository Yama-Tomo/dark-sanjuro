module ApplicationHelper
  def model_column_string(model, key)
    if model.is_a?(NonActiveRecord::Base)
      i18n_namespace = "activemodel.attributes.#{model.class.to_s.classify.underscore}.#{key}"
    else
      i18n_namespace = "activerecord.attributes.#{model.class.to_s.classify.underscore}.#{key}"
    end
    I18n.t(i18n_namespace, default: nil)
  end

  def label_field(f, key, opts = {})
    opts = {
      class: "control-label",
    }.merge(opts)

    model = f.object

    f.label key, model_column_string(model, key), opts
  end
end
