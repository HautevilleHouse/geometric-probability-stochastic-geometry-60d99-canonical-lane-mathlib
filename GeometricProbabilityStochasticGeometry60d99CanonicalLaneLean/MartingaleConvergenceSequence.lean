import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean

structure MartingaleConvergenceSequencePackage where
  filtration : Type u
  martingaleSequence : Type v
  integrabilityCondition : Prop
  almostSureConvergence : Prop
  limitBelongsToSpace : Prop

structure MartingaleConvergenceSequenceEvidence (M : MartingaleConvergenceSequencePackage) where
  integrabilityConditionClosed : M.integrabilityCondition
  almostSureConvergenceClosed : M.almostSureConvergence
  limitBelongsToSpaceClosed : M.limitBelongsToSpace

def MartingaleConvergenceSequenceClosed (M : MartingaleConvergenceSequencePackage) : Prop :=
  M.integrabilityCondition ∧ M.almostSureConvergence ∧ M.limitBelongsToSpace

theorem martingale_convergence_sequence_closed_from_evidence (M : MartingaleConvergenceSequencePackage) (E : MartingaleConvergenceSequenceEvidence M) :
    MartingaleConvergenceSequenceClosed M := by
  exact And.intro E.integrabilityConditionClosed (And.intro E.almostSureConvergenceClosed E.limitBelongsToSpaceClosed)

end GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean
end HautevilleHouse