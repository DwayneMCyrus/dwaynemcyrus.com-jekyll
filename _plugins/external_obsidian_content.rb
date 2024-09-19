# ~/Library/Mobile\ Documents/com~apple~CloudDocs/Obsidian/Test

# _plugins/external_obsidian_content.rb
require 'fileutils'

module Jekyll
  class ExternalObsidianContent < Generator
    safe true
    priority :high

    def generate(site)
      # Path to your Obsidian folder (update this to your iCloud Obsidian path)
      obsidian_folder = File.expand_path("~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Toofee")
      
      # Path to Jekyll "_notes" folder
      jekyll_notes_folder = File.join(site.source, "_notes")

      # Create _notes folder if it doesn't exist
      FileUtils.mkdir_p(jekyll_notes_folder)

      # Get all markdown files from the Obsidian folder
      Dir["#{obsidian_folder}/**/*.md"].each do |file|
        destination = File.join(jekyll_notes_folder, File.basename(file))

        # Copy the file only if it doesn't exist or is newer than the destination file
        if !File.exist?(destination) || File.mtime(file) > File.mtime(destination)
          FileUtils.cp(file, destination)
          Jekyll.logger.info "Obsidian Note:", "Copied #{file} to #{jekyll_notes_folder}"
        else
          Jekyll.logger.info "Obsidian Note:", "#{file} is up to date, skipping."
        end
      end
    end
  end
end
