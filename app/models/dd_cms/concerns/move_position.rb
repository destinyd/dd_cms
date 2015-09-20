module DdCms
  module Concerns
    module MovePosition
      extend ActiveSupport::Concern

      included do
        field :position, :type => Integer
        default_scope ->{ order(position: :asc) }

        before_create :set_position, unless: :position

        scope :by_parent, lambda{|parent|
          where(parent_id_name => parent.try(:id)) 
        }
      end

      def set_position
        self.position = Time.now.to_i
      end

      def prev
        self.class.by_parent(parent).where(:position.lt => self.position).last
      end

      def next
        self.class.by_parent(parent).where(:position.gt => self.position).first
      end

      def move_down
        next_record = self.next
        return nil if next_record.nil?

        pos = self.position
        self.position = next_record.position
        self.save!

        next_record.position = pos
        next_record.save!

        self
      end

      def move_up
        prev_record = self.prev
        return nil if prev_record.nil?

        pos = self.position
        self.position = prev_record.position
        self.save!

        prev_record.position = pos
        prev_record.save!

        self
      end

      def parent
        raise 'you must be override this method'
      end

      module ClassMethods
        def parent_id_name
          raise 'you must be override this method'
        end
      end
    end
  end
end

