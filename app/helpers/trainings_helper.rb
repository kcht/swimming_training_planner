module TrainingsHelper
  def can_be_deleted_by_user?(training)
    user_id = training.created_by
    user_id == current_user&.id
  end

  def append_database_field_before_create(hash)
    hash.merge( {created_by: current_user.id, total_distance: total_distance(hash[:content]) })
  end

  def total_distance(content)
    return 0 if !content || content.empty?
    lines = content.split("\n")
    lines.inject(0) do |sum,line|
      line = line.gsub(/\s+/, '')
      merged = line.scan(/\d+[x*]\d+/).join
      if merged.length != 0
        result =merged.split(/[x*]/)
        sum += result[0].to_i * result[1].to_i
      else
        sum += line[/\d+/].to_i
      end
    end
  end
end
