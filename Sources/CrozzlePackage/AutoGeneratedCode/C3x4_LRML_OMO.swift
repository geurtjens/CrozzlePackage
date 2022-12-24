public class C3x4_LRML_OMO {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 4
        let stride = interlockWidth + interlockHeight
        var index = 0 //pointer to where we should put next set of words
        var shapeCount = 0
        var outerStart: [UInt8] = []
        var wordId: [UInt8] = []

        for phase in 0..<2 {
            if phase == 1 {
                wordId = Array(repeating: 0, count: stride * shapeCount)
                outerStart = Array(repeating: 0, count: stride * shapeCount)
            }

            for outery1 in 0..<wordCount {

                if W.Len[outery1] >= interlockHeight + 2 {

                    let outery1Limit = Int(W.Len[outery1]) - Int(interlockHeight)
                    for outery1Pos in 1..<outery1Limit {

                        //print("outery1:\(W.Start[outery1])")

                        for left1 in 0..<wordCount {

                            if (W.Len[left1] >= interlockWidth &&
                                W.End[left1][2] == W.Start[outery1][outery1Pos + 0] &&
                                W.Id[left1] != W.Id[outery1]) {
                                //print("left1:\(W.Start[left1])")

                                for middley2 in 0..<wordCount {

                                    if (W.Len[middley2] == interlockHeight &&
                                        W.Start[middley2][0] == W.End[left1][1] &&
                                        W.Id[middley2] != W.Id[left1] &&
                                        W.Id[middley2] != W.Id[outery1]) {
                                        //print("middley2:\(W.Start[middley2])")

                                        for right2 in 0..<wordCount {

                                            if (W.Len[right2] >= interlockWidth &&
                                                W.Start[right2][0] == W.Start[outery1][outery1Pos + 1] &&
                                                W.Start[right2][1] == W.Start[middley2][1] &&
                                                W.Id[right2] != W.Id[middley2] &&
                                                W.Id[right2] != W.Id[left1] &&
                                                W.Id[right2] != W.Id[outery1]) {
                                                //print("right2:\(W.Start[right2])")

                                                for outery3 in 0..<wordCount {

                                                    if W.Len[outery3] >= interlockHeight + 2 {

                                                        let outery3Limit = Int(W.Len[outery3]) - Int(interlockHeight)
                                                        for outery3Pos in 1..<outery3Limit {

                                                            if (W.Start[outery3][outery3Pos + 0] == W.End[left1][0] &&
                                                            W.Start[outery3][outery3Pos + 1] == W.Start[right2][2] &&
                                                            W.Id[outery3] != W.Id[right2] &&
                                                            W.Id[outery3] != W.Id[middley2] &&
                                                            W.Id[outery3] != W.Id[left1] &&
                                                            W.Id[outery3] != W.Id[outery1]) {
                                                                //print("outery3:\(W.Start[outery3])")

                                                                for middlex3 in 0..<wordCount {

                                                                    if (W.Len[middlex3] == interlockWidth &&
                                                                        W.Start[middlex3][0] == W.Start[outery1][outery1Pos + 2] &&
                                                                        W.Start[middlex3][1] == W.Start[middley2][2] &&
                                                                        W.Start[middlex3][2] == W.Start[outery3][outery3Pos + 2] &&
                                                                        W.Id[middlex3] != W.Id[outery3] &&
                                                                        W.Id[middlex3] != W.Id[right2] &&
                                                                        W.Id[middlex3] != W.Id[middley2] &&
                                                                        W.Id[middlex3] != W.Id[left1] &&
                                                                        W.Id[middlex3] != W.Id[outery1]) {
                                                                        //print("middlex3:\(W.Start[middlex3])")

                                                                        for left4 in 0..<wordCount {

                                                                            if (W.Len[left4] >= interlockWidth &&
                                                                                W.End[left4][2] == W.Start[outery1][outery1Pos + 3] &&
                                                                                W.End[left4][1] == W.Start[middley2][3] &&
                                                                                W.End[left4][0] == W.Start[outery3][outery3Pos + 3] &&
                                                                                W.Id[left4] != W.Id[middlex3] &&
                                                                                W.Id[left4] != W.Id[outery3] &&
                                                                                W.Id[left4] != W.Id[right2] &&
                                                                                W.Id[left4] != W.Id[middley2] &&
                                                                                W.Id[left4] != W.Id[left1] &&
                                                                                W.Id[left4] != W.Id[outery1]) {
                                                                                //print("left4:\(W.Start[left4])")

                                                                                if phase == 0 {
                                                                                    shapeCount += 1
                                                                                }
                                                                                else {
                                                                                    outerStart[index + 4] = UInt8(outery1Pos)

                                                                                    outerStart[index + 6] = UInt8(outery3Pos)

                                                                                    ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [left1, right2, middlex3, left4, outery1, middley2, outery3])
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        return ClusterModel(
            wordId: wordId,
            outerStart: outerStart,
            patternHorizontal: [.leading, .trailing, .middle, .leading],
            patternVertical: [.outer, .middle, .outer],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}