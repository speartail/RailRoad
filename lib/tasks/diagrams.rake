namespace :doc do
  namespace :diagram do
    desc "Creates diagram with all models including ones from gems and ones not connected to DB into Graphviz format (dot)"
    task :models do
      sh "railroad -i -l -a -m -p -t -j -M > doc/models.gv"
    end
    namespace :models do
      desc "Creates diagram for models into svg"
      task :svg do
        sh "railroad -i -l -a -m -M | dot -Tsvg | sed 's/font-size:14.00/font-size:11.00/g' > doc/models.svg"
      end
    end
    desc "Creates diagram for all controllers into Graphviz format (dot)"
    task :controllers do
      sh "railroad -i -l -C > doc/controllers.svg"
    end
    namespace :controllers do
      desc "Creates diagram for all controllers into svg"
      task :svg do
        Time.now.strftime
        sh "railroad -i -l -C | neato -Tsvg | sed 's/font-size:14.00/font-size:11.00/g' > doc/controllers.svg"
      end
    end
  end
  
  desc "Creates both diagrams, for models and controllers into Graphviz format (dot)"
  task :diagrams => %w(diagram:models diagram:controllers)
  
  namespace :diagrams do
    desc "Creates both diagrams, for models and controllers into svg"
    task :svg => %w(diagram:models:svg diagram:controllers:svg)
  end
end