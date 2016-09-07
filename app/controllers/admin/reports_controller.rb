require 'csv'

class Admin::ReportsController < Admin::AdminController

  before_action :authorize_superuser!

  def index
    @metrics = Appo::Metrics.new
    @metrics.collect
  end

  def collections
    @collections =
      Collection
        .order(created_at: :desc)
        .page(params[:page])
        .per(20)

    @collections_grouped_by_date =
      @collections.group_by{ |c|
        c.created_at.in_time_zone('America/Chicago').to_date
      }
  end

  def index_csv
    metrics = Appo::Metrics.stored_metrics
    csv_string = ::CSV.generate do |csv|
      csv << %w(Date Collections Resources Users)
      metrics.each do |m|
        csv << [
          m.fetch('timestamp').split('T').first,
          m.fetch('collections').fetch('total'),
          m.fetch('resources').fetch('total'),
          m.fetch('users').fetch('total')
        ]
      end
    end
<<<<<<< HEAD
    send_data csv_string, filename: "greenprint-report.csv"
=======
    send_data csv_string, filename: "participate-report.csv"
>>>>>>> parent of 0bd3464... customize to greenprintmedia
  end

  def users_graph
    metrics = Appo::Metrics.stored_metrics
    labels = metrics.map{|m| m.fetch('timestamp').split('T').first }
    totals = metrics.map{|m| m.fetch('users').fetch('total') }
    generate_graph_data labels, totals
  end

  def resources_graph
    metrics = Appo::Metrics.stored_metrics
    labels = metrics.map{|m| m.fetch('timestamp').split('T').first }
    totals = metrics.map{|m| m.fetch('resources').fetch('total') }
    generate_graph_data labels, totals
  end

  def collections_graph
    metrics = Appo::Metrics.stored_metrics
    labels = metrics.map{|m| m.fetch('timestamp').split('T').first }
    totals = metrics.map{|m| m.fetch('collections').fetch('total') }
    generate_graph_data labels, totals

    # around 2015-08-01 we imported legacy appolearning categories and STEM
    # pages as collections, adding 334 collections. Subtract 334 from the
    # daily number for 2015-08-01 so that it doesn't skew the daily graph
    if index = @daily[:labels].index('2015-08-01')
      @daily[:datasets].first[:data][index] -= 334
    end
  end

  private

  def generate_graph_data labels, totals
    @total = {
      labels: labels.drop(1),
      datasets: [
        {
          label: 'Total',
          fillColor: "rgba(220,220,220, 0.9)",
          data: totals.drop(1)
        }
      ]
    }

    @daily = {
      labels: labels.drop(1),
      datasets: [
        {
          label: 'Daily',
          fillColor: "rgba(220,220,220, 0.9)",
          data: totals.zip([0] + totals).map{|p| p.reduce(&:-)}.drop(1)
        }
      ]
    }
  end

end
