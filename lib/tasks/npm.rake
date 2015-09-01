namespace :npm do
  desc "Install npm dependencies and cleanup leftover dependencies"
  task install: :environment do
    sh "npm prune"
    sh "npm install"
  end

  desc "Delete node_modules"
  task clear: :environment do
    sh "rm -r node_modules/"
  end

end
