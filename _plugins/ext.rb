Jekyll::Hooks.register :site, :post_read do |site|
  
  site.posts.docs.each do |x|
  	x.data['permalink'] = x.data['permalink'].strip
  	# Jekyll.logger.info(x.data['permalink'])
  end
  site.each do |x|
  	Jekyll.logger.info(x)
  end
end
