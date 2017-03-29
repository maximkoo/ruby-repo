### usage rake new_post[my-new-post] or rake new_post['my new post'] or rake new_post (defaults to "new-post")
desc "Begin a new post in #{source_dir}/#{posts_dir}"
task :today, :title do |t, args|
  #if args.title
  #  title = args.title
  #else
  #  title = get_stdin("Enter a title for your post: ")
  #end
  raise "### You haven't set anything up yet. First run `rake install` to set up an Octopress theme." unless File.directory?(source_dir)
  mkdir_p "#{source_dir}/#{posts_dir}"
  #filename = "#{source_dir}/#{posts_dir}/#{Time.now.strftime('%Y-%m-%d')}-#{title.to_url}.#{new_post_ext}"
    m=Time.now.strftime('%m').to_i
	s=case m 
	when 1 then 'ianvaria'
	when 2 then 'fievralia'
	when 3 then 'marta'
	when 4 then 'aprelia'
	when 5 then 'maia'
	when 6 then 'iiunia'
	when 7 then 'iiulia'
	when 8 then 'avgusta'
	when 9 then 'sientiabria'
	when 10 then 'oktiabria'
	when 11 then 'noiabria'
	when 12 then 'diekabria'
	end;
	sr=case m
	when 1 then 'января'
	when 2 then 'февраля'
	when 3 then 'марта'
	when 4 then 'апреля'
	when 5 then 'мая'
	when 6 then 'июня'
	when 7 then 'июля'
	when 8 then 'августа'
	when 9 then 'сентября'
	when 10 then 'октября'
	when 11 then 'ноября'
	when 12 then 'декабря'
	end;
	
	filename=source_dir+'/'+posts_dir+'/'+Time.now.strftime('%Y-%m-%d')+'-kak-ia-proviol-'+Time.now.strftime('%d').to_i.to_s+'-'+s+'-'+Time.now.strftime('%Y')+'.'+"#{new_post_ext}";
	title='Как я провёл '+Time.now.strftime('%d').to_i.to_s+' '+sr;
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end
  puts "Creating new post: #{filename}"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
    post.puts "date: #{Time.now.strftime('%Y-%m-%d %H:%M:%S %z')}"
    post.puts "comments: true"
    post.puts "categories: "
    post.puts "---"
  end
end
