def funny foo, attrs = {}
    puts attrs[:class]
end

funny 100, {class: "nav-link"}
