namespace :loads do
  desc "Load start table"
  task :stars => :environment do
    loader = LoadStar.new
    loader.process
  end
end
