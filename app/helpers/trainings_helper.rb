module TrainingsHelper
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
        merged  =line.scan(/\d/).join
        sum += merged.to_i
      end
    end
  end
end
