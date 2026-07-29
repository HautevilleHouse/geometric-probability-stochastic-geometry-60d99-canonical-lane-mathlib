import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean

structure GeometryOfRandomMeasuresPackage where
  randomMeasureSpace : Type u
  pointProcess : Type v
  intensityMeasure : Prop
  palmDistribution : Prop
  secondOrderStructure : Prop

structure GeometryOfRandomMeasuresEvidence (G : GeometryOfRandomMeasuresPackage) where
  intensityMeasureClosed : G.intensityMeasure
  palmDistributionClosed : G.palmDistribution
  secondOrderStructureClosed : G.secondOrderStructure

def GeometryOfRandomMeasuresClosed (G : GeometryOfRandomMeasuresPackage) : Prop :=
  G.intensityMeasure ∧ G.palmDistribution ∧ G.secondOrderStructure

theorem geometry_of_random_measures_closed_from_evidence (G : GeometryOfRandomMeasuresPackage) (E : GeometryOfRandomMeasuresEvidence G) :
    GeometryOfRandomMeasuresClosed G := by
  exact And.intro E.intensityMeasureClosed (And.intro E.palmDistributionClosed E.secondOrderStructureClosed)

end GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean
end HautevilleHouse