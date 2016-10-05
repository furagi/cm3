class Gtf::StoragesController < CommonController

  private
    def permitted_params
      {
        :storage => params.permit(:gtf_storage => [
          :storage_priority,
          :media_type,
          :storage_url,
          :subpath1_counter,
          :subpath2_threshold,
          :subpath2_counter,
          :used_space_mb,
          :free_space_mb,
          :minimum_free_space_mb,
          :status,
          :licensing_memcache_queue,
          :allow_encoding_on_demand
        ])[:gtf_storage]
      }
    end


end

