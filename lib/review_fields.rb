module ReviewFields
  FIELDS = ReviewMetadata.all.map(&:field_name)
end
