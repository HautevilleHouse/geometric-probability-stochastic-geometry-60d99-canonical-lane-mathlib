import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean

structure StochasticProcessSpace where
  indexSet : Type u
  stateSpace : Type v
  samplePaths : Type w
  adaptedFiltration : Prop
  measurability : Prop
  continuityInProbability : Prop

structure StochasticProcessSpaceEvidence (S : StochasticProcessSpace) where
  adaptedFiltrationClosed : S.adaptedFiltration
  measurabilityClosed : S.measurability
  continuityInProbabilityClosed : S.continuityInProbability

def StochasticProcessSpaceClosed (S : StochasticProcessSpace) : Prop :=
  S.adaptedFiltration ∧ S.measurability ∧ S.continuityInProbability

theorem stochastic_process_space_closed_from_evidence
    (S : StochasticProcessSpace) (E : StochasticProcessSpaceEvidence S) :
    StochasticProcessSpaceClosed S := by
  exact And.intro E.adaptedFiltrationClosed
    (And.intro E.measurabilityClosed E.continuityInProbabilityClosed)

end GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean
end HautevilleHouse