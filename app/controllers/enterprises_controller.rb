class EnterprisesController < ApplicationController
    before_action :authorize

    def create
        @address = Address.new(address_params)
        @enterprise_photo = Enterprise_photo.new()

        s3 = Aws::S3::Resource.new
        bucket_name = 'name'
        bucket = s3.bucket(bucket_name)

        images_urls = []
        images = params[:image]
        images.each do |image|
            current_time = Time.now
            milliseconds = current_time.usec / 1000
            file_name = "enterprise_photo_#{current_time.strftime('%H_%M_%S')}_#{milliseconds}"

            obj = bucket.object(file_name)
            obj.upload_file(file.tempfile, acl: 'public-read')

            images_urls.push(obj.public_url)
        end
        @enterprise_photo.first_photo_url = images_urls[0]
        @enterprise_photo.second_photo_url = images_urls[1]
        @enterprise_photo.third_photo_url = images_urls[2]

        if @enterprise_photo.valid? && @address.valid?
            @enterprise = Enterprise.new()
            @enteprise.category = Category.find_by(name: params[:category])
            @enterprise.user = User.find(params[:user_id])
            @enterprise.address = @address
            @enterprise.enterprise_photo = @enterprise_photo
        end   
    end

    private 

    def address_params 
        params.permit(:street, :number, :neighborhood, :latitude, :longitude)
    end

    def enterprise_params
        params.permit(:name, :description, :cellphone)
    end
end
