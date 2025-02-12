class GoogleDriveService
    def initialize(user)
      @user = user
      @client = Google::Apis::DriveV3::DriveService.new
      @client.authorization = user.google_token
    end
  
    def list_files
      @client.list_files(q: "mimeType='application/pdf'", fields: 'files(id, name)')
    end
  
    def upload_file(file)
      file_metadata = { name: file.original_filename }
      media = Google::Apis::Core::Hashable.new(file.tempfile)
      @client.create_file(file_metadata, upload_source: media, content_type: file.content_type)
    end
  end
  