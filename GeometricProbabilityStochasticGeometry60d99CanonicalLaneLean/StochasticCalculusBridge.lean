import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean

structure StochasticCalculusBridgePackage where
  semimartingaleSpace : Type u
  stochasticIntegral : Type v
  itoFormula : Prop
  quadraticVariation : Prop
  girsanovTransform : Prop

structure StochasticCalculusBridgeEvidence (S : StochasticCalculusBridgePackage) where
  itoFormulaClosed : S.itoFormula
  quadraticVariationClosed : S.quadraticVariation
  girsanovTransformClosed : S.girsanovTransform

def StochasticCalculusBridgeClosed (S : StochasticCalculusBridgePackage) : Prop :=
  S.itoFormula ∧ S.quadraticVariation ∧ S.girsanovTransform

theorem stochastic_calculus_bridge_closed_from_evidence (S : StochasticCalculusBridgePackage) (E : StochasticCalculusBridgeEvidence S) :
    StochasticCalculusBridgeClosed S := by
  exact And.intro E.itoFormulaClosed (And.intro E.quadraticVariationClosed E.girsanovTransformClosed)

end GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean
end HautevilleHouse