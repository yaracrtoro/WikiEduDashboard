class RevisionAnalyticsService

  def self.dyk_eligible
    Article.joins(:revisions).includes(:revisions).where{ revisions.wp10 > 40 }.where{(namespace == 118) | ((namespace == 2) & (title !~ '%/%'))}
  end

end
