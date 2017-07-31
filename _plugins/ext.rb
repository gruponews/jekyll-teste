require 'breakpoint'
# require 'breakpoint-slicer'

Jekyll::Hooks.register :site, :post_read do |site|
  site.posts.docs.each do |x|
    # Jekyll.logger.info(x)
    if x.data['permalink']
  	 x.data['permalink'] = x.data['permalink'].strip
    end
  end

  site.collections['eventos'].each do |x|
    # Jekyll.logger.info(x)
  	if x.data['permalink']
     x.data['permalink'] = x.data['permalink'].strip
    end
  end

  site.collections['audiosevideos'].each do |x|
    # Jekyll.logger.info(x)
  	if x.data['permalink']
     x.data['permalink'] = x.data['permalink'].strip
    end
  	if x.data['wpcf-gn_audiovideo_audio'].is_a? Array
	  	x.data['wpcf-gn_audiovideo_audio'].each do |url|
				if url.include? 'http://www.gruponews.com.br/wp-content/'
					url = url.gsub! 'http://www.gruponews.com.br/wp-content', '//assets.gruponews.com.br/gruponews'
				end
				Jekyll.logger.info(url)
  		end
  	end
  end
end
