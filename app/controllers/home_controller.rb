class HomeController < ApplicationController
  def index
    gon.weight_data = fetch_data("weight")
    gon.height_data = fetch_data("height")
  end

  def fetch_data(type)
    data = []
    people = current_user.people
    colors = gen_colors(people.size)

    people.each_with_index do |p, idx|
      data.push({
        color: colors[idx],
        data: p.fetch_graph_data(type),
        name: "#{p.first_name + " " + p.last_name}"
        })
    end
    return data
  end
end
