class ChangeSynopsisTSummary < ActiveRecord::Migration[5.0]
  def change
    rename_column :movies, :plot_synopsis, :plot_summary
  end
end
