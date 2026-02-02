class Seed < ApplicationRecord
  # Associations
  belongs_to :parent_one, class_name: "Seed", optional: true
  belongs_to :parent_two, class_name: "Seed", optional: true

  has_many :children_as_parent_one,
           class_name: "Seed",
           foreign_key: :parent_one_id,
           dependent: :restrict_with_exception

  has_many :children_as_parent_two,
           class_name: "Seed",
           foreign_key: :parent_two_id,
           dependent: :restrict_with_exception

  # Validations
  validates :name, presence: true
  validate :must_have_two_parents_unless_root
  validate :parents_must_be_different

  # Returns all children regardless of parent role
  def children
    Seed.where("parent_one_id = ? OR parent_two_id = ?", id, id)
  end

  private

  # Non-root seeds must have two parents
  def must_have_two_parents_unless_root
    return if root_seed?
    if parent_one.nil? || parent_two.nil?
      errors.add(:base, "Seed must have exactly two parents")
    end
  end

  # Prevent parent_one == parent_two
  def parents_must_be_different
    return if root_seed?
    return if parent_one.nil? || parent_two.nil?

    if parent_one_id == parent_two_id
      errors.add(:base, "Parents must be different")
    end
  end

  # Generation-zero seeds
  def root_seed?
    parent_one.nil? && parent_two.nil?
  end
end
