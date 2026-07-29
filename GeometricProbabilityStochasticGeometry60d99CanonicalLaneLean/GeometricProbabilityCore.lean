import GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean.StochasticCalculusPackage

namespace HautevilleHouse
namespace GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean

structure GeometricProbabilityCorePackage where
  randomSetTheory : Prop
  pointProcessTheory : Prop
  randomMeasureTheory : Prop
  stochasticGeometry : Prop

structure GeometricProbabilityCoreEvidence (G : GeometricProbabilityCorePackage) where
  randomSetTheoryClosed : G.randomSetTheory
  pointProcessTheoryClosed : G.pointProcessTheory
  randomMeasureTheoryClosed : G.randomMeasureTheory
  stochasticGeometryClosed : G.stochasticGeometry

def GeometricProbabilityCoreClosed (G : GeometricProbabilityCorePackage) : Prop :=
  G.randomSetTheory ∧ G.pointProcessTheory ∧ G.randomMeasureTheory ∧ G.stochasticGeometry

theorem geometric_probability_core_closed_from_evidence (G : GeometricProbabilityCorePackage)
    (E : GeometricProbabilityCoreEvidence G) : GeometricProbabilityCoreClosed G := by
  exact And.intro E.randomSetTheoryClosed
    (And.intro E.pointProcessTheoryClosed
      (And.intro E.randomMeasureTheoryClosed E.stochasticGeometryClosed))

end GeometricProbabilityStochasticGeometry60d99CanonicalLaneLean
end HautevilleHouse